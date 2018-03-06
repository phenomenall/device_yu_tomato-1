/*
 * Copyright (C) 2018 LundOS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdlib.h>

#include <hardware/power.h>
#include "power-common.h"
#include "power-feature.h"
#include "utils.h"

void set_device_specific_feature(feature_t feature, int state)
{
    char tmp_str[NODE_MAX];
    snprintf(tmp_str, NODE_MAX, "%d", state);

    if (feature == POWER_FEATURE_GESTURES) {
        sysfs_write(GESTURES_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_DRAW_O) {
        sysfs_write(DRAW_O_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_DRAW_M) {
        sysfs_write(DRAW_M_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_DRAW_W) {
        sysfs_write(DRAW_W_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_ONE_FINGER_SWIPE_UP) {
        sysfs_write(ONE_FINGER_SWIPE_UP_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_ONE_FINGER_SWIPE_DOWN) {
        sysfs_write(ONE_FINGER_SWIPE_DOWN_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_ONE_FINGER_SWIPE_LEFT) {
        sysfs_write(ONE_FINGER_SWIPE_LEFT_NODE, tmp_str);
        return;
    }

    if (feature == POWER_FEATURE_ONE_FINGER_SWIPE_RIGHT) {
        sysfs_write(ONE_FINGER_SWIPE_RIGHT_NODE, tmp_str);
        return;
    }
}
