from pytorch/pytorch:latest

COPY *.py /src/
COPY *.pkl /src/
COPY *.json /src/
COPY chatbot_Model.h5 /src/chatbot_Model.h5
RUN mkdir -p ~/nltk_data
RUN mkdir -p ~/nltk_data/chunkers
RUN mkdir -p ~/nltk_data/corpora
RUN mkdir -p ~/nltk_data/grammers
RUN mkdir -p ~/nltk_data/help
RUN mkdir -p ~/nltk_data/misc
RUN mkdir -p ~/nltk_data/models
RUN mkdir -p ~/nltk_data/sentiment
RUN mkdir -p ~/nltk_data/stemmers
RUN mkdir -p ~/nltk_data/taggers
RUN mkdir -p ~/nltk_data/tokenizers

RUN pip install numpy pandas nltk Flask flask-cors tensorflow tensorflow-gpu

WORKDIR /src

RUN python3 -c "import nltk; nltk.download(['punkt', 'wordnet', 'omw-1.4'])"

EXPOSE  5000
CMD ["python3", "-m", "flask", "run"]
