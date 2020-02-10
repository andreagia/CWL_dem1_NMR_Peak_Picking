cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh, runProcessFid.sh]
hints:
  DockerRequirement:
    # dockerPull: tlinnet/relax
    dockerPull: andreagia/nmrpipecwl

stdout: stdout.out

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.workdir)
      - entry: $(inputs.fiddir)
      - entryname: runProcessFid.sh
        entry: |
            #cp -r $1/fid ./
            #chmod -R 664 $1/fid
            basicFT2.com -xP0 -82 -xEXTX1 10.4ppm -xEXTXN 5.4ppm -list > test.com
            sh test.com
            ls -lh
inputs:
  workdir:
    type: Directory
    inputBinding:
      position: 1
  fiddir:
    type: Directory    

outputs:
  std_out:
    type: stdout
  fid_out3:
    type: File
    outputBinding:
      glob: test.ft2
