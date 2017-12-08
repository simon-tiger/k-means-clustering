int numPoints = 100;
int k = 3;

PVector[] data = new PVector[numPoints];
PVector[] prevData;
int[] clusters = new int[numPoints];
PVector[] centroids = new PVector[k];

void setup() {
  size(400, 400);

  reset();
}

void draw() {
  background(255);

  prevData = data.clone();

  for (int i = 0; i < numPoints; i++) {
    float record = MAX_FLOAT;
    int index = -1;

    for (int j = 0; j < k; j++) {
      float d = PVector.dist(data[i], centroids[j]);

      if (d < record) {
        record = d;
        index = j;
      }
    }

    clusters[i] = index;
  }

  for (int i = 0; i < k; i++) {
    float sumX = 0;
    float sumY = 0;
    int numClusteredPoints = 0;

    for (int j = 0; j < numPoints; j++) {
      if (clusters[j] == i) {
        sumX += prevData[j].x;
        sumY += prevData[j].y;
        numClusteredPoints++;
      }
    }

    float meanX = sumX / numClusteredPoints;
    float meanY = sumY / numClusteredPoints;

    centroids[i] = new PVector(meanX, meanY);
  }

  for (int i = 0; i < numPoints; i++) {
    fill(0);
    if (clusters[i] == 0) {
      fill(255, 0, 0);
    } else if (clusters[i] == 1) {
      fill(0, 0, 255);
    } else if (clusters[i] == 2) {
      fill(0, 255, 0);
    }
    noStroke();
    ellipse(data[i].x, data[i].y, 8, 8);
  }

  stroke(0);
  rectMode(CENTER);

  fill(255, 0, 0);
  rect(centroids[0].x, centroids[0].y, 8, 8);

  fill(0, 0, 255);
  rect(centroids[1].x, centroids[1].y, 8, 8);

  fill(0, 255, 0);
  rect(centroids[2].x, centroids[2].y, 8, 8);
}

void mousePressed() {
  reset();
}

float randomGaussian_(float max) {
  return randomGaussian_(0, max);
}

float randomGaussian_(float min, float max) {
  return (((randomGaussian() + 3) / 6) * (max - min) + min);
}

void reset() {
  int index = 0;

  for (int i = 0; i < 33; i++) {
    float x = randomGaussian_(width/2);
    float y = randomGaussian_(height/2);
    PVector datapoint = new PVector(x, y);
    data[index] = datapoint;
    index++;
  }

  for (int i = 0; i < 33; i++) {
    float x = randomGaussian_(width/2, width);
    float y = randomGaussian_(height/2);
    PVector datapoint = new PVector(x, y);
    data[index] = datapoint;
    index++;
  }

  for (int i = 0; i < 34; i++) {
    float x = randomGaussian_(width/2, width);
    float y = randomGaussian_(height/2, height);
    PVector datapoint = new PVector(x, y);
    data[index] = datapoint;
    index++;
  }

  for (int i = 0; i < k; i++) {
    float x = randomGaussian_(width);
    float y = randomGaussian_(height);
    PVector centroid = new PVector(x, y);
    centroids[i] = centroid;
  }
}