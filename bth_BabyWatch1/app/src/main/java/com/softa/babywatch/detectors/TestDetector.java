package com.softa.babywatch.detectors;

import android.view.LayoutInflater;
import android.view.View;

import com.softa.babywatch.BabyState;

public class TestDetector implements BabyDetector {

	@Override
	public BabyState updateState(double average) {
		// TODO Auto-generated method stub
		return BabyState.SLEEPING;
	}

	@Override
	public short getBackgroundLevel() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public short getCurrentLevel() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public View getConfigurationView(LayoutInflater inflater) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getDescription() {
		// TODO Auto-generated method stub
		return "Put your own implementation here!";
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Student detector";
	}
	
    @Override
	public String getText2Label() {
		return "Comparing with level = ";
	}
}
