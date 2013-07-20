#!/usr/bin/env python

import re
import string

max_width = 80
keywords_file = '/Applications/Processing.app/Contents/Resources/Java/modes/java/keywords.txt'
template_file = 'syntax.tmpl'

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
        
        match = re.match('(\w+)\t(\w+)\t(\w*)', line)
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
    for a given set of keywords. Each line will be wrapped at max_width
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
    type_words.sort()

    if excludes:
        type_words = [x for x in type_words if x not in excludes]

    block = ''
    curr_line = prefix
    for word in type_words:
        if len(curr_line + word) + 1 >= max_width:
            block += "%s\n" % curr_line 
            curr_line=prefix
        curr_line += " %s" % word

    return block


class SyntaxTemplate(string.Template):
    """
    Sub-class of string.Template to override the default delimiter.
    """
    delimiter = '%%'

if __name__ == "__main__":

    # Get keywords from file
    words = read_keywords(keywords_file)
    mapping = {}

    # Build syntax chunks for each type of syntax element, and store in a 
    # dictionary for later insertion into the syntax template.
    pfunction_types = ('FUNCTION1', 'FUNCTION2', 'FUNCTION3', 'FUNCTION4')
    pfunction_prefix = "syn keyword processingFunction\tcontained"
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


    # Populate syntax template with syntax chunks, and print.
    with open(template_file) as f:
        template = SyntaxTemplate(f.read())

    print template.substitute(mapping)

