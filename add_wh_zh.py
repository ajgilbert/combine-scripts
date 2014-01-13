#!/usr/bin/env python

'''

Merge template errors from the smallest to the largest contribution in each bin

Orignal script by: Evan K. Friis, UW Madison
Modifications by: A. Gilbert
'''

from RecoLuminosity.LumiDB import argparse
from math import sqrt
import fnmatch
import logging
import os
import ROOT
import shutil
import sys

ROOT.PyConfig.IgnoreCommandLineOptions = True
ROOT.gROOT.SetBatch()  

log = logging.getLogger('merger')

def walk_and_copy(inputdir, outputdir):
    ''' Recursive function which copies from inputdir to outputdir '''
    found_folder = False
    path = inputdir.GetPath().split(':')[1]
    rel_path = path if path[0] != '/' else path[1:]

    directories = []
    histos = []
    for key in inputdir.GetListOfKeys():
        # Keep track of stuff we find in this directory
        name = key.GetName()
        classname = key.GetClassName()
        if classname.startswith('TDirectory'):
            directories.append(name)
        elif isinstance(inputdir.Get(name), ROOT.TH1):
            histos.append(name)

    for histo in histos:
      th1 = inputdir.Get(histo)
      th1.SetName(histo)
      outputdir.cd()
      if (histo.startswith('VH')):
        th1_wh = th1.Clone()
        th1_wh.SetName(histo.replace('VH','WH', 1))
        th1_wh.SetTitle(histo.replace('VH','WH', 1))
        th1_zh = th1.Clone()
        th1_zh.SetName(histo.replace('VH','ZH', 1))
        th1_zh.SetTitle(histo.replace('VH','ZH', 1))
        th1_wh.Write()
        th1_zh.Write()
      th1.Write()

     # Now copy and recurse into subdirectories
    for subdir in directories:
      print "subdir: "+subdir
      output_subdir = outputdir.mkdir(subdir)
     # Recurse
      walk_and_copy(
         inputdir.Get(subdir), output_subdir)

def main(inputfilename, outputfilename):
    input = ROOT.TFile(inputfilename, 'READ')
    if not input:
        raise IOError("Can't open input file: %s" % inputfilename)
    output = ROOT.TFile(outputfilename, 'RECREATE')
    if not output:
        raise IOError("Can't open output file: %s" % outputfilename)
    print 'Input file:  '+inputfilename
    print 'Output file: '+outputfilename
    walk_and_copy(input, output)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('input', help='Input .root file')
    parser.add_argument('output', help='Output .root file')
    parser.add_argument('--verbose', action='store_true',
                        help='Print debug output.')

    args = parser.parse_args()

    logging.basicConfig(
        stream=sys.stderr,
        level=logging.INFO if not args.verbose else logging.DEBUG)

    in_place = True
    if args.input == args.output:
        log.info("Modifying in place!  Backing up input file...")
        shutil.copy(args.input, args.input.replace('.root', '.root.bak'))
        args.output = args.output.replace('.root', '.tmp.root')

    log.info("Building shape systematics. input: %s output: %s",
             args.input, args.output)
    main(args.input, args.output)
    log.info("Moving temprorary output to final destination")
    shutil.move(args.output, args.output.replace('.tmp.root', '.root'))
