public void run()
{ 
	...
	try
	{
		int N = AudioRecord.getMinBufferSize(8000,
				AudioFormat.CHANNEL_IN_MONO,
				AudioFormat.ENCODING_PCM_16BIT); /*N:640*/
		recorder = new AudioRecord(AudioSource.MIC, 8000, 
				AudioFormat.CHANNEL_IN_MONO, 
				AudioFormat.ENCODING_PCM_16BIT, N*10);

		recorder.getState();
		recorder.startRecording();

		/*
		 * Loops until something outside of this 
		 * thread stops it. Reads the data from the 
		 * recorder and calculates an average to use 
		 * in the baby detector.
		 */
		while(!stopped)
		{
			//was 160 now 10
			short[] buffer =  new short[10];
			N = recorder.read(buffer,0,buffer.length);
			double sum = 0;
			for (short val : buffer) {
				sum = sum + Math.abs(val);
			}

			/**
			 * To scale it down, dive by buffer length
			 */
			double average = sum / buffer.length;
			recursiveSum = 
				(ALPHA * oldRecursiveSum) + ((1-ALPHA)*average);
			oldRecursiveSum = recursiveSum;


			final BabyState babyState = 
				detector.updateState(recursiveSum);

			...
}

