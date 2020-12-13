FROM consul:1.9.1

RUN apk add bash

COPY service /service

ENTRYPOINT [ "/service" ]

CMD [ "agent", "-server", "-bootstrap-expect", "1", "-data-dir", "/consul/data", "-datacenter", "global", "-bind", "0.0.0.0", "-client", "0.0.0.0", "-advertise", "100.77.60.69", "-ui", "-protocol", "3"]
