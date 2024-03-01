// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:health/health.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_DELETED,
  DATA_NOT_ADDED,
  DATA_NOT_DELETED,
  STEPS_READY,
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //?fetchStepData();
  }

  List<HealthDataPoint> _healthDataList = [];
  AppState state = AppState.DATA_NOT_FETCHED;
  int nofSteps = 0;
  static final types = [
    HealthDataType.BODY_TEMPERATURE,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.HEART_RATE,
    HealthDataType.WEIGHT,
    
  ];
  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  //! this are the future functions
  Future authorized() async {
    bool? hasPermission =
        await health.hasPermissions(types, permissions: permissions);

    hasPermission = false;
    bool authorized = false;
    if (!hasPermission) {
      try {
        authorized =
            await health.requestAuthorization(types, permissions: permissions);
      } catch (e) {
        debugPrint('exception in authorized $e');
      }
    }
    setState(() {
      state = (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED;
    });
  }

  Future fetchData() async {
    setState(() {
      state = AppState.FETCHING_DATA;
    });
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 20));
    _healthDataList.clear();
    try {
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);
      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (e) {
      debugPrint('Exception from getting health in datatypes $e');
    }
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);
    _healthDataList.forEach((element) {
      debugPrint(element.toString());
    });
    setState(() {
      state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
    });
  }

  Future addData() async {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(minutes: 20));

    bool success = true;
    success &= await health.writeHealthData(
        1.925, HealthDataType.HEIGHT, earlier, now);
    success &=
        await health.writeHealthData(90, HealthDataType.WEIGHT, earlier, now);
    success &= await health.writeHealthData(
        90, HealthDataType.HEART_RATE, earlier, now);
    success &=
        await health.writeHealthData(90, HealthDataType.STEPS, earlier, now);
    success &= await health.writeHealthData(
        200, HealthDataType.ACTIVE_ENERGY_BURNED, earlier, now);
    success &= await health.writeHealthData(
        70, HealthDataType.HEART_RATE, earlier, now);
    success &= await health.writeHealthData(
        37, HealthDataType.BODY_TEMPERATURE, earlier, now);
    success &= await health.writeBloodOxygen(98, earlier, now, flowRate: 1.0);
    success &= await health.writeHealthData(
        105, HealthDataType.BLOOD_GLUCOSE, earlier, now);
    success &=
        await health.writeHealthData(1.8, HealthDataType.WATER, earlier, now);
    success &= await health.writeWorkoutData(
        HealthWorkoutActivityType.AMERICAN_FOOTBALL,
        now.subtract(const Duration(minutes: 15)),
        now,
        totalDistance: 2430,
        totalEnergyBurned: 400);
    success &= await health.writeBloodPressure(90, 80, earlier, now);
    success &= await health.writeHealthData(
        0.0, HealthDataType.SLEEP_REM, earlier, now);
    success &= await health.writeHealthData(
        0.0, HealthDataType.SLEEP_ASLEEP, earlier, now);
    success &= await health.writeHealthData(
        0.0, HealthDataType.SLEEP_AWAKE, earlier, now);
    success &= await health.writeHealthData(
        0.0, HealthDataType.SLEEP_DEEP, earlier, now);

    success &= await health.writeMeal(
        earlier, now, 1000, 50, 25, 50, "Banana", MealType.SNACK);

    setState(() {
      state = success ? AppState.DATA_ADDED : AppState.DATA_NOT_ADDED;
    });
  }

  Future deleteData() async {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(hours: 24));

    bool success = true;
    for (HealthDataType type in types) {
      success &= await health.delete(type, earlier, now);
    }

    setState(() {
      state = success ? AppState.DATA_DELETED : AppState.DATA_NOT_DELETED;
    });
  }

  Future fetchStepData() async {
    int? steps;

    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        debugPrint("Caught exception in getTotalStepsInInterval: $error");
      }

      debugPrint('Total number of steps: $steps');

      setState(() {
        nofSteps = (steps == null) ? 0 : steps;
        state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
      });
    } else {
      debugPrint("Authorization not granted - error in authorization");
      setState(() => state = AppState.DATA_NOT_FETCHED);
    }
  }

  Future revokeAccess() async {
    try {
      await health.revokePermissions();
    } catch (error) {
      debugPrint("Caught exception in revokeAccess: $error");
    }
  }

  //? this are the widgets for the operations
  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(20),
            child: const CircularProgressIndicator(
              strokeWidth: 10,
            )),
        const Text('Fetching data...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          if (p.value is AudiogramHealthValue) {
            return ListTile(
              title: Text("${p.typeString}: ${p.value}"),
              trailing: Text('${p.unitString}'),
              subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
            );
          }
          if (p.value is WorkoutHealthValue) {
            return ListTile(
              title: Text(
                  "${p.typeString}: ${(p.value as WorkoutHealthValue).totalEnergyBurned} ${(p.value as WorkoutHealthValue).totalEnergyBurnedUnit?.name}"),
              trailing: Text(
                  '${(p.value as WorkoutHealthValue).workoutActivityType.name}'),
              subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
            );
          }
          if (p.value is NutritionHealthValue) {
            return ListTile(
              title: Text(
                  "${p.typeString} ${(p.value as NutritionHealthValue).mealType}: ${(p.value as NutritionHealthValue).name}"),
              trailing:
                  Text('${(p.value as NutritionHealthValue).calories} kcal'),
              subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
            );
          }
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return const Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Press the download button to fetch data.'),
        Text('Press the plus button to insert some random data.'),
        Text('Press the walking button to get total step count.'),
      ],
    );
  }

  Widget _authorized() {
    return const Text('Authorization granted!');
  }

  Widget _authorizationNotGranted() {
    return const Text('Authorization not given. '
        'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
        'For iOS check your permissions in Apple Health.');
  }

  Widget _dataAdded() {
    return const Text('Data points inserted successfully!');
  }

  Widget _dataDeleted() {
    return const Text('Data points deleted successfully!');
  }

  Widget _stepsFetched() {
    return Text('Total number of steps: $nofSteps');
  }

  Widget _dataNotAdded() {
    return const Text('Failed to add data');
  }

  Widget _dataNotDeleted() {
    return const Text('Failed to delete data');
  }

  Widget _content() {
    if (state == AppState.DATA_READY) {
      return _contentDataReady();
    } else if (state == AppState.NO_DATA) {
      return _contentNoData();
    } else if (state == AppState.FETCHING_DATA) {
      return _contentFetchingData();
    } else if (state == AppState.AUTHORIZED) {
      return _authorized();
    } else if (state == AppState.AUTH_NOT_GRANTED) {
      return _authorizationNotGranted();
    } else if (state == AppState.DATA_ADDED) {
      return _dataAdded();
    } else if (state == AppState.DATA_DELETED) {
      return _dataDeleted();
    } else if (state == AppState.STEPS_READY) {
      return _stepsFetched();
    } else if (state == AppState.DATA_NOT_ADDED) {
      return _dataNotAdded();
    } else if (state == AppState.DATA_NOT_DELETED) {
      return _dataNotDeleted();
    } else {
      return _contentNotFetched();
    }
  }

  //? int getstep = 0;
  HealthFactory health = HealthFactory();
  /*Future fetchStepData() async {
    int? step;

    var types = [
      HealthDataType.STEPS,
    ];
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    var permissions = [
      HealthDataAccess.READ,
    ];
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        step = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        debugPrint('caught exception $error');
      }
      debugPrint('Total number of steps: $step');

      setState(() {
        getstep = (step == null) ? 0 : step;
      });
    } else {
      debugPrint('Authorization not granted');
    }
  }?*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: [
                TextButton(
                    onPressed: authorized,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: const Text("Auth",
                        style: TextStyle(color: Colors.white))),
                TextButton(
                    onPressed: fetchData,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: const Text("Fetch Data",
                        style: TextStyle(color: Colors.white))),
                TextButton(
                    onPressed: addData,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: const Text("Add Data",
                        style: TextStyle(color: Colors.white))),
                TextButton(
                    onPressed: deleteData,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: const Text("Delete Data",
                        style: TextStyle(color: Colors.white))),
                TextButton(
                    onPressed: fetchStepData,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: const Text("Fetch Step Data",
                        style: TextStyle(color: Colors.white))),
                TextButton(
                    onPressed: revokeAccess,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: const Text("Revoke Access",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
            const Divider(thickness: 3),
            Expanded(child: Center(child: _content()))
          ],
        ),
      ),
    ));
  }
}
