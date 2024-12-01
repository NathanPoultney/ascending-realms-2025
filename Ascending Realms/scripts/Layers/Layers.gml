function EnsureLayersExist() {
    if (!layer_exists("Unit_Instances")) {
        layer_create("Unit_Instances");
    }
    if (!layer_exists("Building_Instances")) {
        layer_create("Building_Instances");
    }
	if (!layer_exists("GUI")) {
	    layer_create(100, "GUI"); 
	}
}
