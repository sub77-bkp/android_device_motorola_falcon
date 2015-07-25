/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void gsm_properties();
void cdma_properties(char cdma_sub[]);

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char bootloader[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    property_get("ro.bootloader", bootloader);

    if (strstr(bootloader, "T531")) {
            /* matisse3g */
        property_set("ro.build.fingerprint", "samsung/matisse3gxx/matisse3g:5.0.2/LRX22G/T531XXU1BOD8:user/release-keys");
        property_set("ro.build.description", "matisse3gxx-user 5.0.2 LRX22G T531XXU1BOD8 release-keys");
        property_set("ro.product.model", "SM-T531");
        property_set("ro.product.device", "matisse3g");
		property_set("ro.telephony.ril_class", "SamsungMSM8226RIL");
		property_set("telephony.lteOnGsmDevice", "0");
		property_set("ro.telephony.default_network", "0");
        } else if (strstr(bootloader, "T530")) {
            /* matissewifi */
        property_set("ro.build.fingerprint", "samsung/matissewifixx/matissewifi:5.0.2/LRX22G/T530XXU1BOD8:user/release-keys");
        property_set("ro.build.description", "matissewifixx-user 5.0.2 LRX22G T530XXU1BOD8 release-keys");
        property_set("ro.product.model", "SM-T530s");
        property_set("ro.product.device", "matissewifi");
        property_set("ro.carrier", "wifi-only");
        property_set("ro.radio.noril", "yes");
        } else if (strstr(bootloader, "T535")) {
            /* matisselte */
        property_set("ro.build.fingerprint", "samsung/matisseltexx/matisselte:5.0.2/LRX22G/T535XXU1BOD8:user/release-keys");
        property_set("ro.build.description", "matisseltexx-user 5.0.2 LRX22G T535XXU1BOD8 release-keys");
        property_set("ro.product.model", "SM-T535");
        property_set("ro.product.device", "matisselte");
        } else if (strstr(bootloader, "T330")) {
            /* milletwifi */
        property_set("ro.build.fingerprint", "samsung/milletwifixx/milletwifi:5.0.2/LRX22G/T330XXU1BOD8:user/release-keys");
        property_set("ro.build.description", "milletwifixx-user 5.0.2 LRX22G T330XXU1BOD8 release-keys");
        property_set("ro.product.model", "SM-T330");
        property_set("ro.product.device", "milletwifi");
        property_set("ro.carrier", "wifi-only");
        property_set("ro.radio.noril", "yes");
        } else if (strstr(bootloader, "T331")) {
            /* millet3g */
        property_set("ro.build.fingerprint", "samsung/millet3gxx/millet3g:5.0.2/LRX22G/T331XXU1BOD8:user/release-keys");
        property_set("ro.build.description", "millet3gxx-user 5.0.2 LRX22G T331XXU1BOD8 release-keys");
        property_set("ro.product.model", "SM-T331");
        property_set("ro.product.device", "millet3g");
		property_set("ro.telephony.ril_class", "SamsungMSM8226RIL");
		property_set("telephony.lteOnGsmDevice", "0");
		property_set("ro.telephony.default_network", "0");
        } else if (strstr(bootloader, "T335")) {
            /* milletlte */
        property_set("ro.build.fingerprint", "samsung/milletltexx/milletlte:5.0.2/LRX22G/T335XXU1BOD8:user/release-keys");
        property_set("ro.build.description", "milletltexx-user 5.0.2 LRX22G T335XXU1BOD8 release-keys");
        property_set("ro.product.model", "SM-T335");
        property_set("ro.product.device", "milletlte");
        }
    property_get("ro.product.device", device);
    ERROR("Found bootloader id %s setting build properties for %s device\n", bootloader, device);

}

void gsm_properties()
{
    property_set("telephony.lteOnGsmDevice", "1");
    property_set("ro.telephony.default_network", "9");
}

void cdma_properties(char cdma_sub[])
{
    property_set("ro.telephony.default_cdma_sub", cdma_sub); // 0: RUIM/SIM  1: NV
    property_set("ro.gps.set_privacy", "1");
    property_set("ro.telephony.ril.v3", "newDriverCallU");
    property_set("telephony.lteOnCdmaDevice", "1");
    property_set("ro.telephony.default_network", "10");
}


