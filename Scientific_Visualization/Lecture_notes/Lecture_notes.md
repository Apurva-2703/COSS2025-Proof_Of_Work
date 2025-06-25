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

Helps visualize extremely large datasets on distributed memory machines. Can be scripted or interactive.

Can be executed in either a standalone mode where computations and interface run on the same machine *or* client-server mode where data server and render server is set to a multi-core server or distributed cluster, whereas client server is separate.