## Dock a ligand near an atom selection or to a new location
## Author: Steven (Yuhang) Wang
## License: MIT/X11
## Date: 02/23/2018
## Version: 0.1.0

proc dock {cmd args} {
    if {$cmd eq "near"} {
        dock_near {*}$args
    } elseif {$cmd eq "to"} {
        dock_to {*}$args
    } else {
        error "unknown subcommand \"$cmd\""
    }
}

# measure center of mass
proc measure_com {ID selection_str} {
    set sel [atomselect $ID "$selection_str"]
    if {[$sel num] == 0} {
        error "Error hint: no atoms were select by \"$selection_str\" in molecule \"$ID\""
        return
    }
    set com [measure center $sel weight mass]
    $sel delete
    return $com
}

#================================================================================================

## Dock a molecule to the center of mass of destination selections
# Usage: dock near <molecule ID of ligand> <ligand_selection> <the other molecule ID> <destination_selection>
# Example:
# dock_to 1 "all" 0 "resid 225"

proc dock_near {args} {
    if {[llength $args] != 4} {
        usage_dock_near
        return
    } else {
        lassign $args ID_ligand selection_ligand  ID_other selection_destination
    }

    set start [measure_com $ID_ligand "$selection_ligand"]
    set destination [measure_com $ID_other "$selection_destination"]

    if {[llength $start] != 3 || [llength $destination] != 3} {
        return
    }

    set ligand [atomselect $ID_ligand "$selection_ligand"]
    $ligand moveby [vecsub $destination $start]
    $ligand delete
}


proc usage_dock_near {} {
    puts [join \
        [list \
            "Purpose: dock a ligand near a destination" \
            "Usage: dock near <molecule ID of ligand> <ligand_selection> <the other molecule ID> <destination_selection>" \
            "Example:" \
            "dock near 1 \"all\" 0 \"resid 225\"" \
            "   where \"1\" is the molecule ID for the ligand" \
            "   and \"0\" is the molecule ID for the protein" \
            "   selection \"all\" selects the ligand in molecule 1" \
            "   selection \"resid 225\" selects the destination" \
        ] \
    "\n" \
    ]
}


#================================================================================================

## Dock a molecule to the a certain XYZ location
# Usage: dock to <molecule ID of ligand> <ligand_selection> <new XYZ coordinates>
# Example:
# dock_to 1 "all" {0 0 0}

proc dock_to {args} {
    if {[llength $args] != 3} {
        usage_dock_to
        return
    } else {
        lassign $args ID_ligand selection_ligand destination
    }

    set start [measure_com $ID_ligand "$selection_ligand"]

    if {[llength $start] != 3 || [llength $destination] != 3} {
        return
    }

    set ligand [atomselect $ID_ligand "$selection_ligand"]
    $ligand moveby [vecsub $destination $start]
    $ligand delete
}


proc usage_dock_to {} {
    puts [join \
        [list \
            "Purpose: dock a ligand to a new XYZ location" \
            "Usage: dock near <molecule ID of ligand> <ligand_selection> <new XYZ location>" \
            "Example:" \
            "dock to 1 \"all\" {0 0 0}" \
            "   where \"1\" is the molecule ID for the ligand" \
            "   selection \"all\" selects the ligand in molecule 1" \
            "   coordinate {0 0 0} is the destination" \
        ] \
    "\n" \
    ]
}
