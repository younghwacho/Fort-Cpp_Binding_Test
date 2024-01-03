extern "C" {
	void modify_array(int nspec[1], double Yi1[], double Yi2[]) {
		for (int i=0; i<nspec[0]; i++) {
			Yi1[i] = Yi1[i] + 10.;
			Yi2[i] = Yi2[i] + 10.;
		}
	}
}
