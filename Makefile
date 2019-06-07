#############################################################################
# Copyright (c) 2013-2018 Intel Corporation
# All rights reserved.
#
# This software and the related documents are Intel copyrighted materials, and
# your use of them is governed by the express license under which they were
# provided to you ("License"). Unless the License provides otherwise, you may
# not use, modify, copy, publish, distribute, disclose or transmit this
# software or the related documents without Intel's prior written permission.
# This software and the related documents are provided as is, with no express
# or implied warranties, other than those that are expressly stated in the
# License.
#
# WARRANTY DISCLAIMER
#
# THESE MATERIALS ARE PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL INTEL OR ITS
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THESE
# MATERIALS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Intel Corporation is the author of the Materials, and requests that all
# problem reports or change requests be submitted to it directly
#############################################################################

ROOTDIR=/opt/intel/system_studio_2019
OCLSDKROOTDIR=$(ROOTDIR)/opencl/SDK
OCLSDKLIBDIR=$(OCLSDKROOTDIR)/lib64
OCLSDKINCDIR=$(OCLSDKROOTDIR)/include

all: alexnet_host.cpp
	gcc -L$(OCLSDKLIBDIR) -I$(OCLSDKINCDIR) alexnet_host.cpp -Wno-deprecated-declarations -Wno-ignored-attributes -lOpenCL -o AlexNet_opencl

clean:
	rm -f AlexNet_opencl 2> /dev/null
