package com.softa.babywatch.detectors;

import android.view.*;
import android.widget.*;

import com.softa.babywatch.BabyState;
import com.softa.babywatch.R;

public class StudentDetector implements BabyDetector {

	// Keeps track of the values
	private short currentValue = 0;
	private int frameCounter = 0;

	// Initializing
	private boolean init = false;
	private boolean senseChange = false;
	private long sum = 0;
	private int percentage = 0;
	private int multiply;

	// Constants
	private final int maxFrames = 10000;
	private final int framesThreshold = 20;
	private final int MAX_ENERGY_CEILING = 6000;


	// Holds the values for the measurements of detector
	private short threshold = 0;
	private short baseline = 0;

	@Override
	public BabyState updateState(double average) {
		BabyState state = null;
		currentValue = (short) average;
		if (!getInit()) {
			state = BabyState.INIT;
			if (frameCounter < maxFrames) {
				sum += currentValue;
				frameCounter++;
				//state = BabyState.SLEEPING;
			} else {
				sum = sum / maxFrames;
				baseline = (short) sum;
				//init = true;
				setInit(true);
				multiply = (MAX_ENERGY_CEILING / baseline);
				threshold = getThreshold(baseline, percentage);
				frameCounter = 0;
				sum = 0;
				state = BabyState.NOISE;
			}
		} else if (getInit()) {
			if (senseChange) {
				threshold = getThreshold(baseline, percentage);
			}
			if (frameCounter > framesThreshold) {
				frameCounter = 0;
				state = BabyState.AWAKE;
			} else if (currentValue > threshold) {
				frameCounter++;
				state = BabyState.NOISE;
			} else {
				if (frameCounter > 0) {
					frameCounter--;
					state = BabyState.NOISE;
				}

			}
		}
		return state;
	}

	/**
	 * getThreshold scales the threshold in relation to the MAX_ENERGY_CEILING
	 * @param baseline the calculated reference point
	 * @param percentage the sensitivity bar's value
	 * @return returns the new threshold scaled to the sensitivity level choosen by the user
	 */
	private short getThreshold(short baseline, int percentage) {
		short temp;
		switch (percentage) {
			case 0:
				temp = (short) (baseline * multiply);
				break;
			case 100:
				temp = (short) (baseline * (multiply*0.001));
				break;
			default:
				double denominate = (double) percentage/100;
				temp = (short) (baseline * (multiply * 
							(double)(1 - denominate)));
				break;
		}
		senseChange = false;
		return temp;
	}

	@Override
	public short getBackgroundLevel() {
		// TODO Auto-generated method stub
		return threshold;
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
		bar.setProgress(0);
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
	public View getConfigurationView(LayoutInflater inflater) {
	...

			@Override
			public void onProgressChanged(SeekBar seekBar, 
				int progress, boolean fromUser) {
				amplitudeLabel.setText(progress + "%");

				percentage = progress;
				senseChange = true;
			}
		});
		amplitudeLabel.setText(0 + "%");
		return configView;
	}

	@Override
	public String getDescription() {
		// TODO Auto-generated method stub
		return "Simple baby detector using recursive averaging. The detector starts 12" +
				" seconds after the start-button has been pressed. Within these 12 seconds" +
				" the detector averages a baseline to handle the noise better." + "\n" +
				"The bar below adjusts the sensitivity of the detector. When increased the " +
				"detector will become more sensitive and trigger for less energy filled sound." +
				" \n";
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Student detector";
	}
	
    @Override
	public String getText2Label() {
		return "Threshold value = ";
	}

	@Override
	public Boolean getInit() {
		return init;
	}

	@Override
	public void setInit(Boolean value) {
		init = value;
	}

	@Override
	public void reset(){
		frameCounter = 0;
		sum = 0;
	}
}
