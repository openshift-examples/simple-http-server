FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

RUN microdnf install --nodocs -y socat iproute

RUN mkdir /www/ && chmod 770 /www/

ADD srv.sh /www/srv.sh

EXPOSE 8080

USER 1984

CMD socat TCP4-LISTEN:8080,fork EXEC:/www/srv.sh
