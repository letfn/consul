FROM consul:1.9.3

RUN apk add bash

COPY main /main

COPY service /service

ENTRYPOINT [ "/service" ]

CMD [ "-server" ]
