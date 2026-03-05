import os
file_loc = os.path.abspath(__file__).split(os.path.sep)
# data_dir = os.path.sep.join(file_loc[:-2]+ ["data-blacktusk"])
data_dir = '/Users/u0102388/Library/Mobile Documents/com~apple~CloudDocs/UBC-DATA/ww_selected_data_2025'

# New structured data directory
main_data_dir =  '/Users/u0102388/Library/Mobile Documents/com~apple~CloudDocs/UBC-DATA/ww_selected_data_2025'
sensor_def_dir = os.path.join(main_data_dir, 'sensor_definitions')
DoD_ordnance_dir = os.path.join(main_data_dir, 'DoD_ordnance_library')
GIF_ordnance_dir = os.path.join(main_data_dir, 'GIF_expanded_ordnance_libraries')

"""
CONSTANTS
"""
import numpy as np
# Default time channels for DoD data (from 0.154 ms to 2.42 ms, logarithmically spaced)
DoD_time_channels = np.r_[0.154, 0.171, 0.19 , 0.211, 0.235, 0.262, 0.292, 0.325, 0.361,
       0.401, 0.446, 0.496, 0.551, 0.613, 0.681, 0.758, 0.842, 0.936,
       1.04 , 1.156, 1.286, 1.429, 1.588, 1.764, 1.961, 2.178, 2.42 ]

# Rx-Tx combinations (i.e., measurement number, mnum) linked with "Z-inclusive".
mnum_Z_inclusive_ultratem = [0, 1, 6, 7, 34, 35, 40, 41, 69, 70, 74, 75, 104, 104, 108, 109]