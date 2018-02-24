# vmd-dock
Dock a ligand near an atom selection or to an exact location

## Usage
First, copy the `dock.tcl` to your current directory.  
Then open VMD's "Extensions/Tk Console" and type `source dock.tcl`.  
This will make the `dock` command available to you.

There are two ways of using the `dock` command.  
You can either use `dock near` or `dock to`.  
`dock near` will dock the ligand near an atom selection.  
`dock to` will dock the ligand to an exact XYZ location.

### `dock near`
- Usage: `dock near <molecule ID of ligand> <ligand_selection> <the other molecule ID> <destination_selection>`
- Example:
  `dock near 1 "all" 0 "resid 225"`  
  "1" is the molecule ID for the ligand.  
  "0" is the molecule ID for the protein.   
  Selection "all" selects the ligand in molecule 1.   
  Selection "resid 225" selects the destination in molecule 0.  


### `dock to`
- Usage: `dock to <molecule ID of ligand> <ligand_selection> <destination XYZ>`
- Example:
  `dock to 1 "all" {0 0 0}`  
  "1" is the molecule ID for the ligand.  
  "0" is the molecule ID for the protein.   
  {0 0 0} is the destination.


## Info
* author: Steven (Yuhang) Wang
* license: MIT/X11

