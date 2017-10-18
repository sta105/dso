function [] = getTrajectoryError( datasetEvaluationDir, trajectoryFile, gtFile )
	intervalDuration=10;
	intervalStep = 5;

	addpath(datasetEvaluationDir);
	addpath([datasetEvaluationDir '/MakePlots']);

	efficientEvalMAVDriftRun( ...
		importdata(gtFile), ...
		trajectoryFile, ...
		intervalDuration, intervalStep, 1 ...
	)
end