FROM consul:1.9.0

RUN apk add bash

COPY service /service

ENTRYPOINT [ "/service" ]

CMD [ "agent", "-server", "-bootstrap-expect", "1", "-data-dir", "/consul/data", "-datacenter", "global", "-bind", "0.0.0.0", "-client", "0.0.0.0", "-adverise", "100.77.60.69", "-ui", "-protocol", "3"]
