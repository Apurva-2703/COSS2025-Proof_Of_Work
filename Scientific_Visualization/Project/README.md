# 🧠 3D Neuron Morphology Analysis Using Python and ParaView

This project is a 3D visualization and morphological analysis of real pyramidal neurons from the entorhinal cortex of Sprague-Dawley (SD) rats. Using ParaView and neuron morphology files from NeuroMorpho.org, the structure and complexity of two neurons were reconstructed in 3D and analyzed using the python library neuroM.

The data originates from the study:
Canto, C. & Witter, M., 2012
[Cellular properties of principal neurons in the rat entorhinal cortex. I. The lateral entorhinal cortex.](https://doi.org/10.1002/hipo.20997)

## 📁 Dataset
Neuron morphology was obtained from NeuroMorpho.org, a central repository for digitally reconstructed neurons. Specifically, two pyramidal neurons were selected from the Canto & Witter, 2012 dataset:

[040809_SL1_c3g](https://neuromorpho.org/neuron_info.jsp?neuron_name=040809_SL1_c3g)

[040809_SL1_C4](https://neuromorpho.org/neuron_info.jsp?neuron_name=040809_SL1_c3g)

In the database, each neuron has a standarized morphology data file in [.swc format](https://swc-specification.readthedocs.io/en/latest/swc.html), which contains text-based representation of the neuron on the basis of cell component type, 3-dimensional axis in micrometers, node radius, and parent identifier. Given this information, it is possible to derive the following morphological features of the neuron by using a python library such as neuron_morphology or neuroM:

* Soma surface area
* Number of stems, bifurcations, and branches
* Soma length
* Total length and Max. path distance

Note: While this project computes key morphological metrics from raw .swc files, cell type classification (e.g., pyramidal vs. interneuron) is based on metadata from NeuroMorpho.org and not inferred directly from geometry.

## 🛠 Methods
For morphological analyis, a python script was designed using the neuroM library to compute and analyze characteristic features of the two neurons. Then, these key morphological metrics were validated against published metadata from Canto & Witter, 2012 to validate the pipeline. 

Whereas, for the visual analysis the .swc files were converted into a .vtk format using the swc2vtk library in python and then imported to ParaView for rendering.

Various filters (e.g., Tube, Calculator, Plot Over Line) were applied to:
* Reconstruct 3D neuron morphology
* Compare bifurcation points and total lengths with those reported in the metadata
* Construct a 3D animation comparing the morphology of two neurons.

## 🧪 Goals
1. Replicate and visualize real-world biological structures using open-source tools.
2. Compare computed morphological metrics (e.g., soma length, dendritic branching) against study-reported values.

## 📊 Outputs
* Summary table comparing computed vs. reported metrics
* Static image snapshot of pyramidal neurons
* Rotating video/animation (.gif or .mp4) of neuron morphology

## 🧾 Citation & Credits
Canto CB, Witter MP. Cellular properties of principal neurons in the rat entorhinal cortex. I. The lateral entorhinal cortex. Hippocampus. 2012 Jun;22(6):1256-76. doi: 10.1002/hipo.20997. Epub 2011 Dec 7. PMID: 22162008.

Data Source: NeuroMorpho.Org
Libraries: swc2vtk, neuroM
Visualization Software: ParaView