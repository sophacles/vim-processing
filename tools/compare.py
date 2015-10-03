#!/usr/bin/env python

import argparse
import os
import sys
import textwrap

old='syn.orig'
new='syn.new'

def get_words(synfile, pattern):
    words = []

    for line in open(synfile):
        line = line.rstrip()
        if line.startswith(pattern):
            line = line[len(pattern):]
            line = line.lstrip()
            words += line.split(' ')

    return set(words)


patterns = {
    'Functions': 'syn keyword processingFunction\tcontained',
    'Types': 'syn keyword processingType',
    'Variables': 'syn keyword processingVariable',
    'Constants': 'syn keyword processingConstant',
}


if __name__ == "__main__":

    # Parse arguments and options
    parser = argparse.ArgumentParser(description='''
            Compare two Vim syntax files for Processing, for a hardcoded set of
            keyword types.
        ''',
        epilog='''
            Example: ./compare.py processing.vim.orig processing.vim.new
        ''')

    parser.add_argument('syn1', metavar='SYN1', type=str,
            help='a Processing syntax definition for Vim')
    parser.add_argument('syn2', metavar='SYN2', type=str,
            help='a Processing syntax definition for Vim')

    args = parser.parse_args()

    if not os.path.isfile(args.syn1):
        sys.exit("Could not open syntax file %s. Does the file exist?" 
                % args.syn1)

    if not os.path.isfile(args.syn2):
        sys.exit("Could not open syntax file %s. Does the file exist?" 
                % args.syn2)

    for key in patterns:
        w1 = get_words(args.syn1, patterns[key])
        w2 = get_words(args.syn2, patterns[key])
        removed = w1 - w2
        added = w2 - w1
        print "- %s" % key
        print "Added:"
        print textwrap.fill(' '.join(added), 
                initial_indent='    ', 
                subsequent_indent='    ')

        print "Removed:"
        print textwrap.fill(' '.join(removed), 
                initial_indent='    ', 
                subsequent_indent='    ')
        print



