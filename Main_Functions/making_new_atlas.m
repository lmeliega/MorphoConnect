spm_defaults;
global defaults;
defaults.analyze.flip = 0;
V = spm_vol('G:\Toolboxes\IBASPM_13Nov2008\Ibaspm_1.0\atlas116.img');
I = spm_read_vols(V);

Ir = I(1:2:end,1:2:end,1:2:end);

indi = find(Ir==77); % Talamo izquierdo.
indd = find(Ir==78); % Talamo derecho.

Vout = spm_vol('F:\LPBA40_Atlas\for_IBASPM\lpba40.spm5.avg152T1.label.nii');
IL = spm_read_vols(Vout);

IL(indi) = 77;
IL(indd) = 78;

ind_pons = find(IL==182);
IL(ind_pons) = 0;

Vout1 = Vout;
[pth,name,ext] = fileparts(Vout.fname);
Vout1.fname = [pth,filesep,name,'_plus_thalamus',ext];
spm_write_vol(Vout1,IL);