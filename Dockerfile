FROM paddlepaddle/paddle:3.0.0-post1
WORKDIR /app

# Clone PaddleOCR
RUN git clone https://github.com/PaddlePaddle/PaddleOCR.git .
RUN pip install -r requirements.txt
RUN pip install paddle-serving-server-gpu flask

# Use pdserving setup
WORKDIR /app/deploy/pdserving
COPY . .

EXPOSE 9292 8868
CMD ["python", "web_service.py", "--config", "config.yml"]
