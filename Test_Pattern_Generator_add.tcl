set mdldir [file dirname [info script]]

puts "Adding DSP Builder System Test_Pattern_Generator to project\n"
set importdir [file join $mdldir "DSPBuilder_Test_Pattern_Generator_import" ]
if { [file exist $importdir] == 0 } {
	puts "Warning expected IP Import directory '$importdir' not found.\n"
}

set_global_assignment -name "QIP_FILE" [file join $mdldir "Test_Pattern_Generator.qip" ]

if { [file exist [file join $mdldir "Test_Pattern_Generator_add_user.tcl" ]] } {
	source [file join $mdldir "Test_Pattern_Generator_add_user.tcl" ]
}

source [file join $mdldir "DSPBuilder_Test_Pattern_Generator_import/StateMachineEditor1_add.tcl" ]
source [file join $mdldir "DSPBuilder_Test_Pattern_Generator_import/StateMachineEditor_add.tcl" ]

# Add an index file for the Librarian
set ipDir "[get_project_directory]/ip/Test_Pattern_Generator/";
if { ![file exists $ipDir] } {
	file mkdir $ipDir;
}
# Reference the file by relative path if possible
if { [file pathtype $mdldir] == "relative" } {
	set mdlIPX "../../$mdldir/Test_Pattern_Generator.ipx"
} else {
	set mdlIPX "${mdldir}/Test_Pattern_Generator.ipx"
}
set ipxFP [open "$ipDir/Test_Pattern_Generator.ipx" w]
puts $ipxFP "<library><index file='$mdlIPX'/></library>"
close $ipxFP

foreach g [glob -nocomplain "[file join $mdldir "DSPBuilder_Test_Pattern_Generator_import" ]/*.entityimport"] {
	file copy -force $g $ipDir
}
