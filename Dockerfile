# syntax=docker/dockerfile:1.4

FROM quay.io/vexxhost/bindep-loci:latest AS bindep

FROM quay.io/vexxhost/openstack-builder-focal:latest AS builder
COPY --from=bindep --link /runtime-pip-packages /runtime-pip-packages

FROM quay.io/vexxhost/openstack-runtime-focal:0de594e879056d0b130c99e5482e62da5088248f AS runtime
COPY --from=bindep --link /runtime-dist-packages /runtime-dist-packages
COPY --from=builder --link /var/lib/openstack /var/lib/openstack
