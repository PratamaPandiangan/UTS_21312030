import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(String nama, String harga) async {
    CollectionReference products = firestore.collection("products");

    try {
      await products.add({
        "name": nama,
        "price": harga,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data produk",
          onConfirm: () {
            cNama.clear();
            cHarga.clear();
            Get.back();
            Get.back();
            textConfrim:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }
}

class MahasiswaController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController ageController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }

  Future<void> addMahasiswa(String name, int gender) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "name": name,
        "gender": gender,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        onConfirm: () {
          nameController.clear();
          ageController.clear();
          Get.back();
        },
      );
    } catch (e) {
      // Handle error jika terjadi
    }
  }

  Future<void> updateMahasiswa(
      String id, String updatedName, int updatedGender) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.doc(id).update({
        "name": updatedName,
        "gender": updatedGender,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil update data mahasiswa",
        onConfirm: () {
          Get.back();
        },
      );
    } catch (e) {
      // Handle error jika terjadi
    }
  }

  Future<void> deleteMahasiswa(String id) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.doc(id).delete();
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menghapus data mahasiswa",
        onConfirm: () {
          Get.back();
        },
      );
    } catch (e) {
      // Handle error jika terjadi
    }
  }
}
