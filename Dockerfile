FROM consul:1.9.1

RUN apk add bash

COPY service /service

ENTRYPOINT [ "/service", "agent", "-server", "-data-dir", "/consul/data", "-datacenter", "global", "-bind", "0.0.0.0", "-client", "0.0.0.0", "-ui", "-protocol", "3" ]

CMD []
