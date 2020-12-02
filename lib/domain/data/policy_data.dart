import 'package:killergames/core/core.dart';
import 'package:killergames/domain/data/resources/resources.dart';
import 'package:killergames/domain/entities/entities.dart';

class PolicyData {
  static Map<PolicyType, AppPolicy> get policies {
    return {
      PolicyType.PrivacyPolicy: AppPolicy(
        policyName: 'Privacy Policy',
        policyDescriptions: [
          StringRes.policyPrivacyDescriptionOne,
          StringRes.policyPrivacyDescriptionTwo,
        ],
        dateCreated: DateTime(2020, 10, 13),
        dateUpdated: DateTime(2020, 10, 13),
        sections: [
          PolicySection(
            title: 'Interpretation and Definitions',
            subsections: [
              PolicySubsection(
                title: 'Interpretation',
                content: [
                  ContentParagrah(StringRes.policyPrivacy1a),
                ],
              ),
              PolicySubsection(
                title: 'Definitions',
                content: [
                  ContentParagrah(StringRes.policyPrivacy2a),
                  ContentList(StringRes.policyPrivacy2b, title: 'Account'),
                  ContentList(StringRes.policyPrivacy2c, title: 'Affiliate'),
                  ContentList(StringRes.policyPrivacy2d, title: 'Application'),
                  ContentList(StringRes.policyPrivacy2e, title: 'Business'),
                  ContentList(StringRes.policyPrivacy2f, title: 'Company'),
                  ContentList(StringRes.policyPrivacy2g, title: 'Consumer,'),
                  ContentList(StringRes.policyPrivacy2h, title: 'Country'),
                  ContentList(StringRes.policyPrivacy2i,
                      title: 'Data Controller'),
                  ContentList(StringRes.policyPrivacy2j, title: 'Device'),
                  ContentList(StringRes.policyPrivacy2k, title: 'Do Not Track'),
                  ContentList(StringRes.policyPrivacy2l,
                      title: 'Personal Data'),
                  ContentList(StringRes.policyPrivacy2m, title: 'Sale'),
                  ContentList(StringRes.policyPrivacy2n, title: 'Service'),
                  ContentList(StringRes.policyPrivacy2o,
                      title: 'Service Provider'),
                  ContentList(StringRes.policyPrivacy2p,
                      title: 'Third-party Social Media Service'),
                  ContentList(StringRes.policyPrivacy2q, title: 'Usage Data'),
                  ContentList(StringRes.policyPrivacy2r, title: 'You'),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Collecting and Using Your Personal Data',
            subsections: [
              PolicySubsection(
                title: 'Types of Data Collected: Personal Data',
                content: [
                  ContentParagrah(StringRes.policyPrivacy3a),
                  ContentList('Email address'),
                  ContentList('First name and last name'),
                  ContentList('Usage Data'),
                ],
              ),
              PolicySubsection(
                title: 'Types of Data Collected: Usage Data',
                content: [
                  ContentParagrah(StringRes.policyPrivacy3b),
                  ContentParagrah(StringRes.policyPrivacy3c),
                  ContentParagrah(StringRes.policyPrivacy3d),
                  ContentParagrah(StringRes.policyPrivacy3e),
                ],
              ),
              PolicySubsection(
                title:
                    'Types of Data Collected: Information from Third-Party Social Media Services',
                content: [
                  ContentParagrah(StringRes.policyPrivacy3f),
                  ContentList('Google'),
                  ContentList('Facebook'),
                  ContentList('Apple'),
                  ContentList('Twitter'),
                  ContentList('Github'),
                  ContentParagrah(StringRes.policyPrivacy3g),
                  ContentParagrah(StringRes.policyPrivacy3h),
                ],
              ),
              PolicySubsection(
                title: 'Use of Your Personal Data',
                content: [
                  ContentParagrah(StringRes.policyPrivacy4a),
                  ContentList(StringRes.policyPrivacy4b,
                      title: 'To provide and maintain our Service'),
                  ContentList(StringRes.policyPrivacy4c,
                      title: 'To manage Your Account:'),
                  ContentList(StringRes.policyPrivacy4d,
                      title: 'For the performance of a contract:'),
                  ContentList(StringRes.policyPrivacy4e,
                      title: 'To contact You:'),
                  ContentList(StringRes.policyPrivacy4f,
                      title: 'To provide You'),
                  ContentList(StringRes.policyPrivacy4g,
                      title: 'To manage Your requests:,'),
                  ContentParagrah(StringRes.policyPrivacy4h),
                  ContentList(StringRes.policyPrivacy4i,
                      title: 'With Service Providers:'),
                  ContentList(StringRes.policyPrivacy4j,
                      title: 'For Business transfers:'),
                  ContentList(StringRes.policyPrivacy4k,
                      title: 'With Affiliates:'),
                  ContentList(StringRes.policyPrivacy4l,
                      title: 'With Business partners:'),
                  ContentList(StringRes.policyPrivacy4m,
                      title: 'With other users:'),
                ],
              ),
              PolicySubsection(
                title: 'Retention of Your Personal Data',
                content: [
                  ContentParagrah(StringRes.policyPrivacy5a),
                  ContentParagrah(StringRes.policyPrivacy5b),
                ],
              ),
              PolicySubsection(
                title: 'Transfer of Your Personal Data',
                content: [
                  ContentParagrah(StringRes.policyPrivacy6a),
                  ContentParagrah(StringRes.policyPrivacy6b),
                  ContentParagrah(StringRes.policyPrivacy6c),
                ],
              ),
              PolicySubsection(
                title:
                    'Disclosure of Your Personal Data: Business Transactions',
                content: [
                  ContentParagrah(StringRes.policyPrivacy7a),
                ],
              ),
              PolicySubsection(
                title: 'Disclosure of Your Personal Data: Law enforcement',
                content: [
                  ContentParagrah(StringRes.policyPrivacy8a),
                ],
              ),
              PolicySubsection(
                title:
                    'Disclosure of Your Personal Data: Other legal requirements',
                content: [
                  ContentParagrah(StringRes.policyPrivacy9a),
                  ContentList(StringRes.policyPrivacy9b),
                  ContentList(StringRes.policyPrivacy9c),
                  ContentList(StringRes.policyPrivacy9d),
                  ContentList(StringRes.policyPrivacy9e),
                  ContentList(StringRes.policyPrivacy9f),
                ],
              ),
              PolicySubsection(
                title: 'Security of Your Personal Data',
                content: [
                  ContentParagrah(StringRes.policyPrivacy10a),
                ],
              ),
            ],
          ),
          PolicySection(
            title:
                'Detailed Information on the Processing of Your Personal Data',
            subsections: [
              PolicySubsection(
                title: 'Analytics',
                content: [
                  ContentParagrah(StringRes.policyPrivacy11a),
                  ContentList(StringRes.policyPrivacy11b,
                      title: 'Google Analytics'),
                  ContentList(StringRes.policyPrivacy11c, title: 'Firebase'),
                ],
              ),
              PolicySubsection(
                title: 'Advertising',
                content: [
                  ContentParagrah(StringRes.policyPrivacy11a),
                  ContentList(StringRes.policyPrivacy11b,
                      title: 'Google Analytics'),
                  ContentList(StringRes.policyPrivacy11c, title: 'Firebase'),
                ],
              ),
              PolicySubsection(
                title: 'Email Marketing',
                content: [
                  ContentParagrah(StringRes.policyPrivacy11a),
                  ContentList(StringRes.policyPrivacy11b,
                      title: 'Google Analytics'),
                  ContentList(StringRes.policyPrivacy11c, title: 'Firebase'),
                ],
              ),
              PolicySubsection(
                title: 'Payments',
                content: [
                  ContentParagrah(StringRes.policyPrivacy11a),
                  ContentList(StringRes.policyPrivacy11b,
                      title: 'Google Analytics'),
                  ContentList(StringRes.policyPrivacy11c, title: 'Firebase'),
                ],
              ),
              PolicySubsection(
                title: 'Behavioral Remarketing',
                content: [
                  ContentParagrah(StringRes.policyPrivacy11a),
                  ContentList(StringRes.policyPrivacy11b,
                      title: 'Google Analytics'),
                  ContentList(StringRes.policyPrivacy11c, title: 'Firebase'),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'GDPR Privacy',
            subsections: [
              PolicySubsection(
                title: 'Legal Basis for Processing Personal Data under GDPR',
                content: [
                  ContentParagrah(StringRes.policyPrivacy16a),
                  ContentList(StringRes.policyPrivacy16b, title: 'Consent:'),
                  ContentList(StringRes.policyPrivacy16c,
                      title: 'Performance of a contract:'),
                  ContentList(StringRes.policyPrivacy16d,
                      title: 'Legal obligations:'),
                  ContentList(StringRes.policyPrivacy16e,
                      title: 'Vital interests:'),
                  ContentList(StringRes.policyPrivacy16f,
                      title: 'Public interests:'),
                  ContentList(StringRes.policyPrivacy16g,
                      title: 'Legitimate interests:'),
                  ContentParagrah(StringRes.policyPrivacy16h),
                ],
              ),
              PolicySubsection(
                title: 'Your Rights under the GDPR',
                content: [
                  ContentParagrah(StringRes.policyPrivacy16a),
                  ContentList(StringRes.policyPrivacy16b, title: 'Consent:'),
                  ContentList(StringRes.policyPrivacy16c,
                      title: 'Performance of a contract:'),
                  ContentList(StringRes.policyPrivacy16d,
                      title: 'Legal obligations:'),
                  ContentList(StringRes.policyPrivacy16e,
                      title: 'Vital interests:'),
                  ContentList(StringRes.policyPrivacy16f,
                      title: 'Public interests:'),
                  ContentList(StringRes.policyPrivacy16g,
                      title: 'Legitimate interests:'),
                  ContentParagrah(StringRes.policyPrivacy16h),
                ],
              ),
              PolicySubsection(
                title: 'Exercising of Your GDPR Data Protection Rights',
                content: [
                  ContentParagrah(StringRes.policyPrivacy18a),
                  ContentParagrah(StringRes.policyPrivacy18b),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'CCPA Privacy',
            subsections: [
              PolicySubsection(
                title: 'Your Rights under the CCPA',
                content: [
                  ContentParagrah(StringRes.policyPrivacy19a),
                  ContentList(StringRes.policyPrivacy19b,
                      title: 'The right to notice.'),
                  ContentList(StringRes.policyPrivacy19c,
                      title: 'The right to access / the right to request.'),
                  ContentList(StringRes.policyPrivacy19d,
                      title:
                          'The right to say no to the sale of Personal Data.'),
                  ContentList(StringRes.policyPrivacy19e,
                      title: 'The right to know about Your Personal Data.'),
                  ContentList(StringRes.policyPrivacy19f,
                      title: 'The right to delete Personal Data.'),
                ],
              ),
              PolicySubsection(
                title: 'Exercising Your CCPA Data Protection Rights',
                content: [
                  ContentParagrah(StringRes.policyPrivacy20a),
                  ContentParagrah(StringRes.policyPrivacy21a),
                ],
              ),
              PolicySubsection(
                title: 'Exercising Your CCPA Data Protection Rights',
                content: [
                  ContentParagrah(StringRes.policyPrivacy20a),
                  ContentParagrah(StringRes.policyPrivacy21a),
                ],
              ),
              PolicySubsection(
                title: 'Do Not Sell My Personal Information',
                content: [
                  ContentParagrah(StringRes.policyPrivacy21a),
                  ContentParagrah(StringRes.policyPrivacy21b),
                  ContentParagrah(StringRes.policyPrivacy21c),
                ],
              ),
              PolicySubsection(
                title: 'Do Not Sell My Personal Information: Website',
                content: [
                  ContentParagrah(StringRes.policyPrivacy21d),
                  ContentList(StringRes.policyPrivacy21e),
                  ContentList(StringRes.policyPrivacy21f),
                  ContentList(StringRes.policyPrivacy21g),
                  ContentList(StringRes.policyPrivacy21h),
                  ContentParagrah(StringRes.policyPrivacy21i),
                ],
              ),
              PolicySubsection(
                title: 'Do Not Sell My Personal Information: Mobile Devices',
                content: [
                  ContentParagrah(StringRes.policyPrivacy21j),
                  ContentList(StringRes.policyPrivacy21k),
                  ContentList(StringRes.policyPrivacy21l),
                  ContentParagrah(StringRes.policyPrivacy21m),
                ],
              ),
            ],
          ),
          PolicySection(
            title:
                '"Do Not Track" Policy as Required by California Online Privacy Protection Act (CalOPPA)',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy22a),
                  ContentParagrah(StringRes.policyPrivacy22b),
                ],
              ),
            ],
          ),
          PolicySection(
            title:
                'Your California Privacy Rights (California\'s Shine the Light law)',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy23a),
                  ContentParagrah(StringRes.policyPrivacy23b),
                ],
              ),
            ],
          ),
          PolicySection(
            title:
                'California Privacy Rights for Minor Users (California Business and Professions Code Section 22581)',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy24a),
                  ContentParagrah(StringRes.policyPrivacy24b),
                  ContentParagrah(StringRes.policyPrivacy24c),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Links to Other Websites',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy25a),
                  ContentParagrah(StringRes.policyPrivacy25b),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Changes to this Privacy Policy',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy26a),
                  ContentParagrah(StringRes.policyPrivacy26b),
                  ContentParagrah(StringRes.policyPrivacy26c),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Contact Us',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy22a),
                  ContentList(StringRes.policyPrivacy22b),
                ],
              ),
            ],
          ),
        ],
      ),
      PolicyType.TermsOfService: AppPolicy(
        policyName: 'Terms of Service',
        policyDescriptions: [
          StringRes.policyTOSDescriptionOne,
        ],
        dateCreated: DateTime(2020, 10, 13),
        dateUpdated: DateTime(2020, 10, 13),
        sections: [
          PolicySection(
            title: 'Interpretation and Definitions',
            subsections: [
              PolicySubsection(
                title: 'Interpretation',
                content: [
                  ContentParagrah(StringRes.policyTOS1a),
                ],
              ),
              PolicySubsection(
                title: 'Definitions',
                content: [
                  ContentParagrah(StringRes.policyTOS2a),
                  ContentList(StringRes.policyTOS2b, title: 'Application'),
                  ContentList(StringRes.policyTOS2c,
                      title: 'Application Store'),
                  ContentList(StringRes.policyTOS2d, title: 'Affiliate'),
                  ContentList(StringRes.policyTOS2e, title: 'Account'),
                  ContentList(StringRes.policyTOS2f, title: 'Country'),
                  ContentList(StringRes.policyTOS2g, title: 'Company,'),
                  ContentList(StringRes.policyTOS2h, title: 'Device'),
                  ContentList(StringRes.policyTOS2i, title: 'Feedback'),
                  ContentList(StringRes.policyTOS2j, title: 'Goods'),
                  ContentList(StringRes.policyTOS2k, title: 'In-app Purchase'),
                  ContentList(StringRes.policyTOS2l, title: 'Orders'),
                  ContentList(StringRes.policyTOS2m, title: 'Promotions'),
                  ContentList(StringRes.policyTOS2n, title: 'Service'),
                  ContentList(StringRes.policyTOS2o,
                      title: 'Terms and Conditions'),
                  ContentList(StringRes.policyTOS2p,
                      title: 'Third-party Social Media Service'),
                  ContentList(StringRes.policyTOS2q, title: 'You'),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Acknowledgment',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy3a),
                  ContentParagrah(StringRes.policyPrivacy3b),
                  ContentParagrah(StringRes.policyPrivacy3c),
                  ContentParagrah(StringRes.policyPrivacy3d),
                  ContentParagrah(StringRes.policyPrivacy3e),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Placing Orders for Goods',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS4a),
                ],
              ),
              PolicySubsection(
                title: 'Your Information',
                content: [
                  ContentParagrah(StringRes.policyTOS4b),
                  ContentParagrah(StringRes.policyTOS4c),
                  ContentParagrah(StringRes.policyTOS4d),
                ],
              ),
              PolicySubsection(
                title: 'Order Cancellation',
                content: [
                  ContentParagrah(StringRes.policyTOS4e),
                  ContentList(StringRes.policyTOS4f),
                  ContentList(StringRes.policyTOS4g),
                  ContentList(StringRes.policyTOS4h),
                  ContentParagrah(StringRes.policyTOS4i),
                ],
              ),
              PolicySubsection(
                title: 'Order Cancellation: Your Order Cancellation Rights',
                content: [
                  ContentParagrah(StringRes.policyTOS4j),
                  ContentParagrah(StringRes.policyTOS4k),
                  ContentParagrah(StringRes.policyTOS4l),
                  ContentParagrah(StringRes.policyTOS4m),
                  ContentParagrah(StringRes.policyTOS4n),
                  ContentList(StringRes.policyTOS4o),
                  ContentList(StringRes.policyTOS4p),
                  ContentList(StringRes.policyTOS4q),
                  ContentList(StringRes.policyTOS4r),
                  ContentList(StringRes.policyTOS4s),
                ],
              ),
              PolicySubsection(
                title: 'Availability, Errors and Inaccuracies',
                content: [
                  ContentParagrah(StringRes.policyTOS4t),
                  ContentParagrah(StringRes.policyTOS4u),
                ],
              ),
              PolicySubsection(
                title: 'Prices Policy',
                content: [
                  ContentParagrah(StringRes.policyTOS4v),
                  ContentParagrah(StringRes.policyTOS4w),
                ],
              ),
              PolicySubsection(
                title: 'Payments',
                content: [
                  ContentParagrah(StringRes.policyTOS4x),
                  ContentParagrah(StringRes.policyTOS4y),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'In-app Purchases',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS5a),
                  ContentParagrah(StringRes.policyTOS5b),
                  ContentParagrah(StringRes.policyTOS5c),
                  ContentParagrah(StringRes.policyTOS5d),
                  ContentParagrah(StringRes.policyTOS5e),
                  ContentParagrah(StringRes.policyTOS5f),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Promotions',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS6a),
                  ContentParagrah(StringRes.policyTOS6b),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'User Accounts',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS7a),
                  ContentParagrah(StringRes.policyTOS7b),
                  ContentParagrah(StringRes.policyTOS7c),
                  ContentParagrah(StringRes.policyTOS7d),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Intellectual Property',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS8a),
                  ContentParagrah(StringRes.policyTOS8b),
                  ContentParagrah(StringRes.policyTOS8c),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Your Feedback to Us',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS9a),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Links to Other Websites',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS10a),
                  ContentParagrah(StringRes.policyTOS10b),
                  ContentParagrah(StringRes.policyTOS10c),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Termination',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS11a),
                  ContentParagrah(StringRes.policyTOS11b),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Limitation of Liability',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS12a),
                  ContentParagrah(StringRes.policyTOS12b),
                  ContentParagrah(StringRes.policyTOS12c),
                ],
              ),
            ],
          ),
          PolicySection(
            title: '"AS IS" and "AS AVAILABLE" Disclaimer',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS13a),
                  ContentParagrah(StringRes.policyTOS13b),
                  ContentParagrah(StringRes.policyTOS13c),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Governing Law',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS14a),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Disputes Resolution',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS15a),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'For European Union (EU) Users',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS16a),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'United States Legal Compliance',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS17a),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Severability and Waiver',
            subsections: [
              PolicySubsection(
                title: 'Severability',
                content: [
                  ContentParagrah(StringRes.policyTOS18a),
                ],
              ),
              PolicySubsection(
                title: 'Waiver',
                content: [
                  ContentParagrah(StringRes.policyTOS18b),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Translation Interpretation',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS19a),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Changes to These Terms and Conditions',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyTOS20a),
                  ContentParagrah(StringRes.policyTOS20b),
                ],
              ),
            ],
          ),
          PolicySection(
            title: 'Contact Us',
            subsections: [
              PolicySubsection(
                content: [
                  ContentParagrah(StringRes.policyPrivacy21a),
                  ContentList(StringRes.policyPrivacy21b),
                ],
              ),
            ],
          ),
        ],
      ),
    };
  }
}
