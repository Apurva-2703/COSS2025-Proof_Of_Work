# Notes from the Sci. Vis. with ParaView lecture with Jarno van der Kolk 

## Useful tools for Python visualization

* [Visual landscape of libraries](https://rougier.github.io/python-visualization-landscape/landscape-colors.html)

* [MatplotLib library](https://matplotlib.org/stable/gallery/index.html): Best for static representation of data.
* [Seaborn Python library](https://seaborn.pydata.org/examples/index.html): Dynamic visualizations in large variety of formats. Similar to Matplotlib but easier to use.
* [Vega-Altair](https://altair-viz.github.io/gallery/index.html): Pythonic ggplot with built-in interactivity, ideal for statisical visualization and teaching.
* [Plotly library](https://python-graph-gallery.com/): Ideal for interactivity and browser-based visualizations.
* [HoloViews](https://holoviews.org/): Best for big-data exploration and including animations over time or interactivity.
* [Bokeh library](https://docs.bokeh.org/en/latest/docs/gallery.html): Interactive but code-heavy visualizations, helps customization, and often serves as the backend for more abstract libraries like HoloViews. Best for dashboards.

## ParaView: Open source, multi-platform data analysis and visualization software

[Paraview website](https://www.paraview.org/)

Helps render and visualize extremely large datasets on distributed memory machines. Can be scripted or interactive. Based on Visualization Toolkit(VTK).

Can be executed in either a standalone mode where computations and interface run on the same machine *or* client-server mode where data server and render server is set to a multi-core server or distributed cluster, whereas client server is separate.

Data flow in VTK:
* Reader (Intakes the imported data - .VTK with ASCII data for small datasets and .VTS for large datasets)
* Filters (Modify data)
* Mapper (Transform data to selected geometry)
* Renderer (Convert geometry to selected lighting/size/orientation)

Exporting in .pvd (paraview data-type) allows you to export the edited dataset with the object.

VTK 3D data structures:
* Image data/Structured points (.vti)
* Rectilinear grid (.vtr): need to provide steps along coordinate axis.
* Structuregrid (.vts): regular topology and irregular geometry. Need coordinates of each point.
* Particles/Unstructures points (.particles)
* Polygonal data (.vtp): unstructured topology, suited for maps.
* Unstructured grid (.vtu): all of the above in single file.

### Writing XML VTK from Python
To export data to binary VTK files for visualization of analysis, one may use the Python [EVTK library](https://github.com/pyscience-projects/pyevtk)

  ```python $pip install pyevtk```

One may use scientific data formats such as NetCDF and HDF5 to store large arrays of data, which would otherwise not be ppossible in ASCII, VTK, or raw binary.

### Filters
Filters process data to generate, extract, or derive additional features. [Click here for Paraview-filters documentation.](http://bit.ly/ZX5u2q)

Remainder of this session was a follow-along on using filters on an open-source dataset. The project component of this course displays my customized use of filters to develop a pipeline and compute descriptive statistics.

### Exporting and viewing scenes
Use PV Glance to visualize 3D models in-browser after exporting your project (with all the filters visible in the pipeline) in a VTKJS format. [Link to PV Glance](https://kitware.github.io/glance/app/)

### Animation methods
* Use built-in animation property of any pipeline object
* Time-series animation based on a sequence of similar files
* Python scripting

Note from demo: It is preferable to export your animation as image sequence(jpg or png) rather than .mp4, since it allows us to preserve resolution and gives control over transitions, annotations, and multimedia components.