FROM python:3.11.9

LABEL image.author.name = 'Maria Gorczyca'

# Set up environment
WORKDIR /stress-resistance-msc

# Install dependencies
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter and nbconvert - to execute notebooks automatically
RUN pip install notebook nbconvert

# Copy notebooks and create data, output and visualisations folders
RUN mkdir -p /stress-resistance-msc/data \
    && mkdir -p /stress-resistance-msc/output_data \
    && mkdir -p /stress-resistance-msc/visualisations

# Copy and allow execution of run script
RUN chmod +x /stress-resistance-msc/run_all.sh

# Expose port for Jupyter
EXPOSE 8888

# Set default command
CMD ["./run_all.sh"]