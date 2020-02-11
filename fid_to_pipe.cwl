cwlVersion: v1.0
class: CommandLineTool
baseCommand: [/bin/csh, runProcessFid.sh]
hints:
  DockerRequirement:
    # dockerPull: tlinnet/relax
    dockerPull: andreagia/nmrpipecwl

stdout: stdout.out

requirements:
  InitialWorkDirRequirement:
    listing:
      #- entry: $(inputs.workdir)
      - entry: $(inputs.fiddir)
      - entryname: runProcessFid.sh
        entry: |
          #cwl doesn't set correclty docker user 
          #in order to work set the right env
          source /opt/software/NMRPipe/com/nmrInit.linux212_64.com
          basicFT2.com -xP0 auto -yP0 90 -list > nmr.com
          csh nmr.com
            
inputs:
  # workdir:
  #   type: Directory
  #   inputBinding:
  #     position: 1
  fiddir:
    type: File   

outputs:
  std_out:
    type: stdout
  fid_out3:
    type: File
    outputBinding:
      glob: test.ft2
