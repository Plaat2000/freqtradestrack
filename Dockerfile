FROM freqtradeorg/freqtrade:develop

USER root
RUN pip install plotly

USER ftuser
