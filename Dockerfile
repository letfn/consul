FROM consul:1.9.1

RUN apk add bash

COPY main /main

COPY service /service

ENTRYPOINT [ "/service", "agent", "-data-dir", "/consul/data", "-bind", "0.0.0.0", "-client", "0.0.0.0", "-ui", "-protocol", "3" ]

CMD []
