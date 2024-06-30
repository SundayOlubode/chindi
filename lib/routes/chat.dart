import 'package:chindi_ke/utils/constants/colors.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: ChindiSizes.chatAppBarImageSize,
                height: ChindiSizes.chatAppBarImageSize,
                child: ClipOval(
                  child: Image(
                    image: AssetImage(ChindiTexts.anesuImagePath),
                  ),
                ),
              ),
              SizedBox(width: ChindiSizes.spaceBtwItems),
              Text('${ChindiTexts.anesu} ${ChindiTexts.kafesu}'),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(56, 28, 114, 1),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            const Expanded(
              child: _DisplayMessages(),
            ),
            SafeArea(
              bottom: true,
              top: false,
              child: Container(
                color: ChindiColors.primary,
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ChindiTexts.typeMessage,
                          hintStyle: TextStyle(
                            color: ChindiColors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: ChindiColors.white,
                      ),
                      onPressed: () {
                        // Send message functionality
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DisplayMessages extends StatelessWidget {
  const _DisplayMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: ChindiSizes.spaceBtwItems),
              Text(
                ChindiTexts.today,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ChindiSizes.spaceBtwItems),
              const _MessageTile(
                  msgText: ChindiTexts.textFromAnesu, msgTimestamp: '12:00'),
              const _MessageOwnTile(
                msgText: ChindiTexts.responseToMsg,
                msgTimestamp: '12:01',
              ),
              const _MessageTile(
                  msgText: ChindiTexts.textFromAnesu, msgTimestamp: '12:02'),
              const _MessageOwnTile(
                msgText: ChindiTexts.responseToMsg,
                msgTimestamp: '12:03',
              ),
              const _MessageTile(
                  msgText: ChindiTexts.textFromAnesu, msgTimestamp: '12:04'),
              const _MessageOwnTile(
                msgText: ChindiTexts.responseToMsg,
                msgTimestamp: '12:05',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final String msgText;
  final String msgTimestamp;

  const _MessageTile({
    required this.msgText,
    required this.msgTimestamp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 300,
              decoration: const BoxDecoration(
                color: ChindiColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  msgText,
                  style: const TextStyle(color: ChindiColors.white),
                ),
              ),
            ),
            Text(msgTimestamp),
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  final String msgText;
  final String msgTimestamp;

  const _MessageOwnTile({
    required this.msgText,
    required this.msgTimestamp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: ChindiColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                  bottomLeft: Radius.circular(26),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  msgText,
                  style: const TextStyle(color: ChindiColors.white),
                ),
              ),
            ),
            Text(msgTimestamp),
          ],
        ),
      ),
    );
  }
}
