FROM python:3.9

# Copy and install requirements
COPY requirements.txt requirements.txt

RUN pip install -U pip cython wheel
RUN pip install -r requirements.txt

# Copy the main folder for the API
COPY streamlit streamlit

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
