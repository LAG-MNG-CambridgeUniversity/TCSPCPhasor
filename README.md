# TCSPCPhasor： A global approach to TCSPC data analysis.
A MATLAB app for phasor plot analysis of TCSPC data.

Refer to the manual (20200514_TCSPCPhasor_Manual.pdf) before use.

This application allows for:
* Phasor analysis: Generates lifetime images and tabulated values;
* Cell to Phasor analysis (Single image processing only): Mapping of selected ROI on the cell image to corresponding phasors in the phasor plot;
* Phasor to Cell analysis: Mapping of selected ROI on the phasor plot to corresponding pixels in the cell image;
* Cell segmentation (Single image processing only): Creates .tif masks for .sdt files.

Notes:
* Operates on B&H .sdt files (saved in Scan Sync In mode);
* Requires a MATLAB runtime of 2019B;
* Requires all m-scripts included in the zipped folder;
* Requires the Computer Vision Toolbox (please install beforehand).
