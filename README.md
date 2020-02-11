# CWL_dem1_NMR_Peak_Picking
CWL workflow for NMR spectra Peak Picking  
The workflow takes as input a series of 2D <sup>1</sup>H <sup>15</sup>N HSQC NMR spectra and uses [nmrpipe](https://www.ibbr.umd.edu/nmrpipe/install.html) tools to convert the spectra in nmrpipe format and performs an automatic peak picking.   
This test uses a protein MDM2 with different ligands and peptide and generate a peak list with <sup>1</sup>H and <sup>15</sup>N chemical shift values for each spectrum. The difference among these peak lists can be used to characterize the ligand binding site on the protein.  
Test 
- Install [cwl-runner](https://github.com/common-workflow-language/cwltool)  
- Install docker 
- run cwl-runner nmrpipe_workflow.cwl nmrpipe_workflow.yml
# The steps contained in the workflow are the followings:  

1. **bruker_to_script**: It reads Bruker files format and creates the "convertion script"  
2. **script_to_fid**: runs the "convertion script" in order to convert the data to nmrpipe free formats  
3. **fid_to_pipe**: executes FFT and autophasing on nmrpipe data  
4. **pipe_to_pick**: executes nmrpipe peak-piking algorithm