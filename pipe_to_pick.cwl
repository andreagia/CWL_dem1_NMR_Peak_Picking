cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh, runPick.sh]
hints:
  DockerRequirement:
    # dockerPull: tlinnet/relax
    dockerPull: andreagia/nmrpipecwl

stdout: stdout.out

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.ft2)
      - entryname: runPick.sh
        entry: |
            #cp -r $1/fid ./
            #chmod -R 664 $1/fid
            #basicFT2.com -xP0 -82 -xEXTX1 10.4ppm -xEXTXN 5.4ppm -list > test.com
            #sh test.com
            #ls -lh
            pkDetect2D.tcl -in test.ft2
inputs:
  ft2:
    type: File    

outputs:
  std_out:
    type: stdout
  fid_out4:
    type: File
    outputBinding:
      glob: test.tab
