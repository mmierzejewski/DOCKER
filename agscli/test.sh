#!/bin/sh
kinit idsid@GER.CORP.INTEL.COM
curl -v --negotiate -u : -k https://login.swiss.intel.com/login
klist