package com.softa.babywatch.detectors;

import android.view.*;
import android.widget.*;

import com.softa.babywatch.BabyState;
import com.softa.babywatch.R;

public class StudentDetector implements BabyDetector {

	private short currentValue;
	private short maxValue = 0;
	private int counter;
	final int positiveFrames = 0;
	private boolean start = false;
	private final int seconds = 5;
	private int threshold;
	private int gain;

	@Override
	public BabyState updateState(double average) {
		start();
		currentValue = (short) average;
		if (currentValue > maxValue) {
			maxValue = currentValue;
		}
		return BabyState.NOISE;
	}


	@Override
	public short getBackgroundLevel() {
		// TODO Auto-generated method stub
		return maxValue;
	}

	@Override
	public short getCurrentLevel() {
		// TODO Auto-generated method stub
		return currentValue;
	}

	@Override
	public View getConfigurationView(LayoutInflater inflater) {
		View configView = inflater.inflate(R.layout.simple_student_detector, null);

		final TextView amplitudeLabel = (TextView) configView.findViewById(R.id.sensValue);

		SeekBar bar = (SeekBar) configView.findViewById(R.id.senseBar);
		bar.setProgress(10);
		bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {

			@Override
			public void onStopTrackingTouch(SeekBar seekBar) {
				// Do nothing
			}

			@Override
			public void onStartTrackingTouch(SeekBar seekBar) {
				// Do nothing
			}

			@Override
			public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
				//limit = (short) (Short.MAX_VALUE * progress / 100);
				amplitudeLabel.setText(progress + "%");
			}
		});
		amplitudeLabel.setText(10 + "%");
		return configView;
	}

	@Override
	public String getDescription() {
		// TODO Auto-generated method stub
		return "Simple baby detector using recursive averaging. The detector starts 5" +
				" seconds after the start-button has been pressed." + "\n";
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Student detector";
	}
	
    @Override
	public String getText2Label() {
		return "Current max value measured = ";
	}

	/**
	 * The detector is set to start working after a predefined "seconds".
	 * This gives the caretaker time to leave the room without setting off the alarm
	 */
	private void start() {
		if (!start) {
			for (int i = 0; i < seconds; i++) {
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// Handle different
					e.printStackTrace();
				}
			}
		}
		start = true;
	}
}
