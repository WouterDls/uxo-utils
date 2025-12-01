% created by wdls (wworks) - 19/11/2025

%%%%%%%%%%%%%%%%%%%
% Run this script in the folder where you create the h5-file
%%%%%%%%%%%%%%%%%%%


path = '/Users/u0102388/Library/Mobile Documents/com~apple~CloudDocs/UBC-DATA/D1/ultraTEMcart/';
filename = "Boise_3Fa_230620_clean_1line";
name = fullfile(path,filename + ".mat");

if exist(filename + ".h5",'file')
    delete(fname);
end

data = load(name);
data = data.data;
st = struct;

% Sensor
st.SensorName = data.Sensor.Name;
st.SensorConfig = data.Sensor.ConfigName;
st.SensorTimes = data.Sensor.Times;
% XYZ data
st.XYZ.Info = obj2struct(data.Info.DataInfoXYZ);
st.XYZ.Data = data.XYZData.Data;


% celldata
if ~isempty(data.CellData)
    st.CELLInfo = obj2struct(data.Info.DataInfoCell);

    st.CELL(numel(data.CellData)) = struct('Data',[],'Target',[],'CellStd',[],'Mask',[],'InvResults',struct);
    for kk = 1:numel(data.CellData)
        st.CELL(kk).Target = data.CellData(kk).Target;
        st.CELL(kk).Data = data.CellData(kk).Data;
        st.CELL(kk).CellStd = data.CellData(kk).CellStd;

        st.CELL(kk).Mask = struct(...
            'Flag',data.CellData(kk).Mask.Flag,...
            'Poly',data.CellData(kk).Mask.Poly,...
            'Date',data.CellData(kk).Mask.Date...
            );

        for mm = 1:numel(data.CellData(kk).InvResults)
            if mm == 1
                st.CELL(kk).InvResults = struct(...
                    'ModelFinal',data.CellData(kk).InvResults(mm).ModelFinal,...
                    'DataFinal',data.CellData(kk).InvResults(mm).DataFinal,...
                    'MaskIndices',data.CellData(kk).InvResults(mm).MaskIndices,...
                    'Invert',struct(data.CellData(kk).InvResults(mm).Invert)...
                    );
            else
                st.CELL(kk).InvResults(mm) = struct(...
                    'ModelFinal',data.CellData(kk).InvResults(mm).ModelFinal,...
                    'DataFinal',data.CellData(kk).InvResults(mm).DataFinal,...
                    'MaskIndices',data.CellData(kk).InvResults(mm).MaskIndices,...
                    'Invert',struct(data.CellData(kk).InvResults(mm).Invert)...
                    );
            end
            st.CELL(kk).InvResults(mm).Invert.BTInvert.n_obj = int32(st.CELL(kk).InvResults(mm).Invert.BTInvert.n_obj);
            st.CELL(kk).InvResults(mm).Invert.BTInvert.obj_1__n_start_models = int32(st.CELL(kk).InvResults(mm).Invert.BTInvert.obj_1__n_start_models);
            st.CELL(kk).InvResults(mm).Invert.BTInvert.obj_n__n_start_models = int32(st.CELL(kk).InvResults(mm).Invert.BTInvert.obj_n__n_start_models);
        end
    end
end
h5FileName = sprintf('%s.h5',filename);
location = '/';
export_hdf5(st,h5FileName,location,'overwrite',2)

