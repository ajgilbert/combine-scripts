#!/usr/bin/env python
import fnmatch
import os
import ROOT
import sys
from optparse import OptionParser


parser = OptionParser()

parser.add_option("-i","--input_folder", dest="input",
                  help="Folder containing output of combine" % vars())
parser.add_option("-j","--jobs", dest="jobs", type="int",
                  help="Number of jobs submitted" % vars())
parser.add_option("-p","--points", dest="points", type="int",
                  help="Number of points per job" % vars())

(options, args) = parser.parse_args()


filesSeen = 0
filesVerified = 0

jobrange = range(1,options.jobs+1)


filelist = [ ]

for root, dirnames, filenames in os.walk(options.input):
  for filename in fnmatch.filter(filenames, 'higgsCombine*MultiDimFit*.root'):
    fullfile = os.path.join(root, filename)
    filelist.append(fullfile)

for i in jobrange:
  substr = "-"+str((i-1)*options.points+1)+"-"+str(i*options.points)+".root"
  #print substr
  foundfile = False
 
  for x in filelist:
    if substr in x: 
      foundfile = True
      filename = x
  if not foundfile:
    print "Not found file for job: "+str(i)
  else:
    fin =  ROOT.TFile(filename)
    tin = fin.Get("limit")
    if fin and tin:
      if tin.GetEntries() != options.points+2:
        print "Tree does not have correct number of entries for job: "+str(i)+" ("+str(tin.GetEntries()-2)+")"
    else:
      print "File is corrupt for job: "+str(i)
