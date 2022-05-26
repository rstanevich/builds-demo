
                    #  PY36  #  
                  #            #
### BUILLD BASE # # #  PY37 # # # FINAL
                  #            #
                    #  PY38  #

FROM ubuntu:bionic AS base
RUN apt-get update

FROM base AS py36
RUN sleep 20 && echo "py36" > py36

FROM base AS py37
RUN sleep 20 && echo "py37" > py37

FROM base AS py38
RUN sleep 20 && echo "py38" > py38

FROM base AS final
COPY --from=py36 py36 .
COPY --from=py37 py37 .
COPY --from=py38 py37 .
