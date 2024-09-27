import 'package:flutter/material.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';

class AppBarWidget extends PreferredSize {
  final LoginResponse? user;
  AppBarWidget({super.key, this.user})
      : super(
          preferredSize: const Size.fromHeight(250),
          child: SizedBox(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(156, 41, 176, 1),
                    Color.fromRGBO(64, 18, 172, 0.694),
                  ], stops: [
                    0.0,
                    0.695
                  ], transform: GradientRotation(2.13959913 * 3.14))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(text: "Olá, ", children: [
                        TextSpan(
                          text: "seja bem vindo ${user!.name}",
                        )
                      ])),
                      const SizedBox(
                        width: 58,
                        height: 58,
                        child: Icon(Icons.person),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
