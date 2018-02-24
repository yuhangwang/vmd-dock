# vmd-dock
Dock a ligand near an atom selection or to an exact location

## Usage
There are two ways of using the `dock` command.  
You can either `dock near` or `dock to`.  
`dock near` will dock the ligand near an atom selection, while   
`dock to` will dock the ligand to an exact XYZ location.

### `dock near`
Usage: `dock near <molecule ID of ligand> <ligand_selection> <the other molecule ID> <destination_selection>`

### Example:
"dock near 1 "all" 0 "resid 225"" 
where "1" is the molecule ID for the ligand", 
and "0" is the molecule ID for the protein.  
Selection "all" selects the ligand in molecule 1. 
Selection "resid 225" selects the destination.


## Info
* author: Steven (Yuhang) Wang
* license: MIT/X11

