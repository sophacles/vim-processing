#!/usr/bin/env python

import argparse
import os
import re
import string
import sys
import textwrap
import datetime

MAX_WIDTH = 80

def read_keywords(keywords_file):
    """
    Parses a Processing keywords.txt file, returning a dictionary of
    all keywords in the file, indexed by keyword type.

    Arguments:
    keywords_file -- full path to a Processing keywords.txt file

    """
    keywords = {}

    for line in open(keywords_file):

        # Skip blank lines and comments
        if re.match('^s*$', line):
            continue
        if re.match('^\s*#', line):
            continue

        match = re.match('^(\w+)\s*\t(\w+)\t?(\w*)', line)
        if match:
            (kw_name, kw_type, kw_loc) = match.groups()
            if kw_type in keywords:
                keywords[kw_type].add(kw_name)
            else:
                keywords[kw_type] = set([kw_name])

    return keywords


def get_syntax_block(keywords, required_types, prefix, excludes=None):
    """
    Returns a string containing part of a vim syntax definition file
    for a given set of keywords. Each line will be wrapped at MAX_WIDTH
    characters.

    Arguments:
    keywords       -- dictionary of keywords by type, as returned by
                      read_keywords.
    required_types -- the type of keywords to include. i.e. the required
                      indexes of the keywords dictionary.
    prefix         -- string to prefix to each line of output.

    Keyword arguments:
    excludes -- tuple of containing keywords to be excluded from the
                output.

    """
    type_words = []
    for type in required_types:
        type_words += keywords[type]

    # Remove non-unique keywords, then sort.
    type_words = list(set(type_words))
    type_words.sort()

    if excludes:
        type_words = [x for x in type_words if x not in excludes]

    block = textwrap.fill(' '.join(type_words), MAX_WIDTH,
                            initial_indent=prefix,
                            subsequent_indent=prefix)

    return block


class SyntaxTemplate(string.Template):
    """
    Sub-class of string.Template to override the default delimiter.
    """
    delimiter = '%%'


if __name__ == "__main__":

    # Parse arguments and options
    parser = argparse.ArgumentParser(description='''
            Generate Vim syntax file for Processing. This program takes the
            keywords.txt file supplied with processing, and uses it to create a
            Vim syntax file.
        ''')

    parser.add_argument('keywords_file', metavar='KEYWORDS_FILE', type=str,
            help='path to Processing keywords.txt')
    parser.add_argument('-t', '--template', dest='template_file',
            default='syntax.tmpl',
            help='path to syntax template file. (default: %(default)s)')

    args = parser.parse_args()

    if not os.path.isfile(args.keywords_file):
        sys.exit("Could not open keywords file %s. Does the file exist?"
                % args.keywords_file)

    if not os.path.isfile(args.template_file):
        sys.exit("Could not open syntax template file %s. Does the file exist?"
                % args.template_file)

    # Get keywords from file
    words = read_keywords(args.keywords_file)
    mapping = {}

    # Build syntax chunks for each type of syntax element, and store in a
    # dictionary for later insertion into the syntax template.
    pfunction_types = ('FUNCTION1', 'FUNCTION2', 'FUNCTION4')
    pfunction_prefix = "syn keyword processingFunction\tcontained "
    mapping['kw_functions'] = get_syntax_block(words,
                                               pfunction_types,
                                               pfunction_prefix)

    pconstant_types = ('LITERAL2',)
    pconstant_prefix = "syn keyword processingConstant\t"
    mapping['kw_constants'] = get_syntax_block(words,
                                               pconstant_types,
                                               pconstant_prefix)

    pvariable_types = ('KEYWORD2', 'KEYWORD4')
    pvariable_prefix = "syn keyword processingVariable\t"
    pvariable_excludes = ('frameRate', 'mousePressed', 'keyPressed')
    mapping['kw_variables'] = get_syntax_block(words,
                                               pvariable_types,
                                               pvariable_prefix,
                                               pvariable_excludes)

    ptype_types = ('KEYWORD5',)
    ptype_prefix = "syn keyword processingType\t"
    mapping['kw_types'] = get_syntax_block(words,
                                               ptype_types,
                                               ptype_prefix)


    # other template info - date and version
    # TODO: fix version - include a command line arg
    mapping['version'] = '1.0.0 custom'
    mapping['date'] = str(datetime.date.today())
    # Populate syntax template with syntax chunks, and print.
    with open(args.template_file) as f:
        template = SyntaxTemplate(f.read())

    print template.substitute(mapping)

