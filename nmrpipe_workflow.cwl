#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

requirements:
  ScatterFeatureRequirement: {}

# WORKFLOW INPUT
inputs:
  workdir_array:
    type: Directory[]
    inputBinding:
      position: 1
  
# WORKFLOW OUTPUT
outputs:
    final_result:
      type: File[]
      #outputSource: script_to_fid/fid_out2
      #outputSource: fid_to_pipe/fid_out3
      outputSource: pipe_to_pick/fid_out4


# WORKFLOW STEPS
steps:
  # STEP 1
  # genera lo/gli script fid.com nella directory di input
  brucker_to_script:
    run: brucker_to_script.cwl
    scatter: workdir
    in: 
      workdir: workdir_array
    out:
      [fid_out]



  # STEP2
  script_to_fid:
    run: script_to_fid.cwl
    scatter: 
      - fidcom
      - workdir
    scatterMethod: dotproduct  
    in: 
      workdir: workdir_array
      fidcom: brucker_to_script/fid_out
    out:
      [fid_out2]



  # STEP 3
  fid_to_pipe:
    run: fid_to_pipe.cwl
    scatter: 
      - fiddir
      - workdir
    scatterMethod: dotproduct  
    in:
      workdir: workdir_array
      fiddir: script_to_fid/fid_out2
    out:
      [fid_out3]


  # STEP 4
  pipe_to_pick:
    run: pipe_to_pick.cwl
    scatter: ft2
    in:
      #workdir: workdir
      ft2: fid_to_pipe/fid_out3
    out:
      [fid_out4]  


