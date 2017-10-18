function [] = runEvaluation(executable, config, datasetDir)
	datasets = { ...
		% 'MH_01_easy', ...
		% 'MH_02_easy', ...
		% ------- started from 20 ------- %
		% 'MH_03_medium', ...
		% 'MH_04_difficult', ...
		% 'MH_05_difficult', ...
		% 'V1_01_easy', ...
		% ------- started from 15 ------- %
		'V1_02_medium', ...
		% 'V1_03_difficult', ...
		% 'V2_01_easy', ...
		% 'V2_02_medium', ...
		% 'V2_03_difficult', ...
	};

	for datasetIdx = 1:size(datasets, 2)
		for iterIdx = 0:9
			while true
				arguments = [ ...
					[' calib='	datasetDir '/camera.txt'], ...
					[' config=' config ' '], ...
					[' bag=' datasetDir '/' datasets{datasetIdx} '/' datasets{datasetIdx} '.bag'], ...
					[' bag_offset=15'], ...
					[' groundtruth=' datasetDir '/' datasets{datasetIdx} '/mav0/state_groundtruth_estimate0/data.csv'], ...
					[' output=' 'mav_' datasets{datasetIdx} '_' num2str(iterIdx) '.txt'], ...
					[' nogui=1']
				];
                [status, cmdout] = system([executable arguments], '-echo')

				if status == 0
					break;
				else
					fileId = fopen('logs/failure.txt\n', 'a');
					fprintf(fileId, datasets{datasetIdx});
					fclose(fileId);
				end
			end
		end
	end
end