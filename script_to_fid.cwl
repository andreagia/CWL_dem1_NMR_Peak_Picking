cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh, runScriptToFid.sh]
hints:
  DockerRequirement:
    # dockerPull: tlinnet/relax
    dockerPull: andreagia/nmrpipecwl

stdout: stdout2.out

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.fidcom)
      - entry: $(inputs.workdir)
      #- entry: $(inputs.fidcom)
      - entryname: runScriptToFid.sh
        entry: |
            ls
            cp $1/ser* .
            cp $1/acqus .
            cp $1/acqu?s ./
            # cp $1/fid.com ./ # to comment if the script is part of the workflow
            sh fid.com
            ls

inputs:
  workdir:
    type: Directory
    inputBinding:
      position: 1
  fidcom:
    type: File    

outputs:
  std_out:
    type: stdout
  fid_out2:
    type: Directory
    outputBinding:
      glob: fid
