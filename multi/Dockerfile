
                    #  PY36  #  
                  #            #
### BUILLD BASE # # #  PY37 # # # FINAL
                  #            #
                    #  PY38  #

FROM ubuntu:bionic AS base
RUN apt-get update

FROM base AS py36
RUN sleep 10 && echo "install py36 env" > py36

FROM base AS py37
RUN sleep 10 && echo "nstall py37 env" > py37

FROM base AS py38
RUN sleep 10 && echo "nstall py38 env" > py38

FROM base AS final
COPY --from=py36 py36 .
COPY --from=py37 py37 .
COPY --from=py38 py38 .
