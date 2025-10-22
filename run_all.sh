#!/bin/bash
echo "Running all notebooks in /stress-resistance-msc ..."

for nb in *.ipynb; do
  jupyter nbconvert --to notebook --execute "$nb" --inplace
done

echo "All notebooks executed."

# Start Jupyter server
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''