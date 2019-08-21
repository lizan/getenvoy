# Copyright 2019 Tetrate
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM gcr.io/distroless/cc

COPY bin/getenvoy /

ARG getenvoy_reference
ENV GETENVOY_REFERENCE=$getenvoy_reference
# Reference is hardcoded for now as I don't think theres a way around this.
# We may have to use bazel to build our Docker images...
RUN ["/getenvoy", "fetch", "@"]
ENTRYPOINT ["/getenvoy", "run", "@"]

