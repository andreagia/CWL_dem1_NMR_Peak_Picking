cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh, runBrukerToScript.sh]
hints:
  DockerRequirement:
    # dockerPull: tlinnet/relax
    dockerPull: andreagia/nmrpipecwl

stdout: stdout.out

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.workdir)
      - entryname: runBrukerToScript.sh
        entry: |
            cp $1/ser* .
            cp $1/acqus .
            cp $1/acqu?s ./
            cp $1/pulseprogram ./
            bruker -auto -notk
            ls

inputs:
  workdir:
    type: Directory
    inputBinding:
      position: 1

outputs:
  std_out:
    type: stdout
  fid_out:
    type: File
    outputBinding:
      glob: fid.com

      


